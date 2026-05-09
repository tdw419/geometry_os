; DESCRIPTION: Renders a cyan box of size 16x25 starting at (396, 127).
; PLAN: r0=396(x), r1=127(y), r2=16(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 127
LDI r2, 16
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
