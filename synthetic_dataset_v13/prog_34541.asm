; DESCRIPTION: Renders a green box of size 16x115 starting at (113, 46).
; PLAN: r0=113(x), r1=46(y), r2=16(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 46
LDI r2, 16
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
