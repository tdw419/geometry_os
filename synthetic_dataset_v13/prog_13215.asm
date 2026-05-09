; DESCRIPTION: Places a white 83x90 rectangle at position (300, 65).
; PLAN: r0=300(x), r1=65(y), r2=83(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 65
LDI r2, 83
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
