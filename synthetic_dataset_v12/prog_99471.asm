; DESCRIPTION: Places a white 55x12 rectangle at position (301, 65).
; PLAN: r0=301(x), r1=65(y), r2=55(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 65
LDI r2, 55
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
