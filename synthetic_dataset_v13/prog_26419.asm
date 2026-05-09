; DESCRIPTION: Renders a green box of size 48x90 starting at (10, 162).
; PLAN: r0=10(x), r1=162(y), r2=48(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 162
LDI r2, 48
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
