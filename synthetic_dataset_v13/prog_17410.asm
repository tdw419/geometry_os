; DESCRIPTION: Renders a green box of size 80x120 starting at (255, 115).
; PLAN: r0=255(x), r1=115(y), r2=80(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 115
LDI r2, 80
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
