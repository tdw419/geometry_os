; DESCRIPTION: Creates a purple rectangular region at (443, 216) spanning 45 by 27 pixels.
; PLAN: r0=443(x), r1=216(y), r2=45(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 216
LDI r2, 45
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
