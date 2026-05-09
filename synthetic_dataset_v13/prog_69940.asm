; DESCRIPTION: Creates a orange rectangular region at (298, 122) spanning 16 by 65 pixels.
; PLAN: r0=298(x), r1=122(y), r2=16(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 122
LDI r2, 16
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
