; DESCRIPTION: Renders a orange box of size 91x86 starting at (237, 132).
; PLAN: r0=237(x), r1=132(y), r2=91(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 132
LDI r2, 91
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
