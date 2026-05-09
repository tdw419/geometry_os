; DESCRIPTION: Places a orange 96x43 rectangle at position (346, 192).
; PLAN: r0=346(x), r1=192(y), r2=96(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 192
LDI r2, 96
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
