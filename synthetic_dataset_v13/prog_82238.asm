; DESCRIPTION: Renders a cyan box of size 105x27 starting at (215, 65).
; PLAN: r0=215(x), r1=65(y), r2=105(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 65
LDI r2, 105
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
