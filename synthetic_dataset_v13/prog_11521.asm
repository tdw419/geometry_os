; DESCRIPTION: Renders a orange box of size 52x91 starting at (16, 143).
; PLAN: r0=16(x), r1=143(y), r2=52(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 143
LDI r2, 52
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
