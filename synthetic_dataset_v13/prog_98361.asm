; DESCRIPTION: Creates a orange rectangular region at (298, 55) spanning 12 by 51 pixels.
; PLAN: r0=298(x), r1=55(y), r2=12(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 55
LDI r2, 12
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
