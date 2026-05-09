; DESCRIPTION: Renders a orange box of size 110x27 starting at (356, 215).
; PLAN: r0=356(x), r1=215(y), r2=110(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 215
LDI r2, 110
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
