; DESCRIPTION: Places a cyan 90x111 rectangle at position (7, 102).
; PLAN: r0=7(x), r1=102(y), r2=90(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 102
LDI r2, 90
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
