; DESCRIPTION: Creates a blue rectangular region at (202, 47) spanning 61 by 103 pixels.
; PLAN: r0=202(x), r1=47(y), r2=61(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 47
LDI r2, 61
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
