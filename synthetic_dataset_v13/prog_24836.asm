; DESCRIPTION: Renders a orange box of size 44x87 starting at (392, 27).
; PLAN: r0=392(x), r1=27(y), r2=44(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 27
LDI r2, 44
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
