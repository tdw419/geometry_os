; DESCRIPTION: Creates a purple rectangular region at (298, 231) spanning 14 by 10 pixels.
; PLAN: r0=298(x), r1=231(y), r2=14(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 231
LDI r2, 14
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
