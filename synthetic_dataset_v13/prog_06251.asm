; DESCRIPTION: Renders a green box of size 42x51 starting at (215, 120).
; PLAN: r0=215(x), r1=120(y), r2=42(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 120
LDI r2, 42
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
