; DESCRIPTION: Places a white 83x71 rectangle at position (240, 76).
; PLAN: r0=240(x), r1=76(y), r2=83(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 76
LDI r2, 83
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
