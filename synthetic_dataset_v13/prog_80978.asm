; DESCRIPTION: Renders a orange box of size 22x47 starting at (152, 177).
; PLAN: r0=152(x), r1=177(y), r2=22(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 177
LDI r2, 22
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
