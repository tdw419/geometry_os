; DESCRIPTION: Renders a red box of size 104x85 starting at (271, 152).
; PLAN: r0=271(x), r1=152(y), r2=104(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 152
LDI r2, 104
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
