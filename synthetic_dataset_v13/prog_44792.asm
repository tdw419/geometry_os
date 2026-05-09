; DESCRIPTION: Places a cyan 111x72 rectangle at position (163, 91).
; PLAN: r0=163(x), r1=91(y), r2=111(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 91
LDI r2, 111
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
