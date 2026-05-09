; DESCRIPTION: Renders a orange box of size 74x87 starting at (425, 146).
; PLAN: r0=425(x), r1=146(y), r2=74(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 146
LDI r2, 74
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
