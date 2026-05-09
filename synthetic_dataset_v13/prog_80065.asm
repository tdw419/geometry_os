; DESCRIPTION: Renders a red box of size 95x68 starting at (330, 86).
; PLAN: r0=330(x), r1=86(y), r2=95(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 86
LDI r2, 95
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
