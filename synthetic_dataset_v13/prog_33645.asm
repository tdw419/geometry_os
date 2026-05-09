; DESCRIPTION: Creates a red rectangular region at (152, 168) spanning 74 by 45 pixels.
; PLAN: r0=152(x), r1=168(y), r2=74(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 168
LDI r2, 74
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
