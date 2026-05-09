; DESCRIPTION: Creates a white rectangular region at (369, 59) spanning 92 by 103 pixels.
; PLAN: r0=369(x), r1=59(y), r2=92(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 59
LDI r2, 92
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
