; DESCRIPTION: Renders a orange box of size 54x87 starting at (444, 164).
; PLAN: r0=444(x), r1=164(y), r2=54(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 164
LDI r2, 54
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
