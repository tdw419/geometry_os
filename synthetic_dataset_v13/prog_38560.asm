; DESCRIPTION: Creates a white rectangular region at (281, 222) spanning 59 by 12 pixels.
; PLAN: r0=281(x), r1=222(y), r2=59(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 222
LDI r2, 59
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
