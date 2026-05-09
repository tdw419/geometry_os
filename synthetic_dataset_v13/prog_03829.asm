; DESCRIPTION: Creates a black rectangular region at (300, 59) spanning 103 by 120 pixels.
; PLAN: r0=300(x), r1=59(y), r2=103(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 59
LDI r2, 103
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
