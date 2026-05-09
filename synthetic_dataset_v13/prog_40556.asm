; DESCRIPTION: Renders a cyan box of size 40x59 starting at (217, 188).
; PLAN: r0=217(x), r1=188(y), r2=40(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 188
LDI r2, 40
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
