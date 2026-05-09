; DESCRIPTION: Renders a orange box of size 48x99 starting at (107, 59).
; PLAN: r0=107(x), r1=59(y), r2=48(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 59
LDI r2, 48
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
