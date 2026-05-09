; DESCRIPTION: Renders a orange box of size 104x100 starting at (130, 89).
; PLAN: r0=130(x), r1=89(y), r2=104(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 89
LDI r2, 104
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
