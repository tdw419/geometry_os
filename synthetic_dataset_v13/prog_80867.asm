; DESCRIPTION: Renders a orange box of size 47x16 starting at (373, 193).
; PLAN: r0=373(x), r1=193(y), r2=47(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 193
LDI r2, 47
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
