; DESCRIPTION: Places a cyan 111x61 rectangle at position (164, 24).
; PLAN: r0=164(x), r1=24(y), r2=111(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 24
LDI r2, 111
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
