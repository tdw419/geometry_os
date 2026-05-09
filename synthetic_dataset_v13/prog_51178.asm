; DESCRIPTION: Renders a orange box of size 48x120 starting at (92, 85).
; PLAN: r0=92(x), r1=85(y), r2=48(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 85
LDI r2, 48
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
