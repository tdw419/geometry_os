; DESCRIPTION: Renders a blue box of size 27x115 starting at (446, 16).
; PLAN: r0=446(x), r1=16(y), r2=27(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 16
LDI r2, 27
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
