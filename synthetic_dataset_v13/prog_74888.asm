; DESCRIPTION: Creates a black rectangular region at (460, 177) spanning 16 by 36 pixels.
; PLAN: r0=460(x), r1=177(y), r2=16(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 177
LDI r2, 16
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
