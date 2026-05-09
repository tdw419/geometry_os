; DESCRIPTION: Renders a cyan box of size 37x53 starting at (415, 175).
; PLAN: r0=415(x), r1=175(y), r2=37(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 175
LDI r2, 37
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
