; DESCRIPTION: Renders a orange box of size 48x86 starting at (263, 137).
; PLAN: r0=263(x), r1=137(y), r2=48(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 137
LDI r2, 48
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
