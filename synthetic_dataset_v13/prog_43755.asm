; DESCRIPTION: Renders a cyan box of size 28x22 starting at (326, 115).
; PLAN: r0=326(x), r1=115(y), r2=28(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 115
LDI r2, 28
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
