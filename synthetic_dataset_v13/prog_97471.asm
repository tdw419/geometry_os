; DESCRIPTION: Creates a yellow rectangular region at (330, 131) spanning 42 by 95 pixels.
; PLAN: r0=330(x), r1=131(y), r2=42(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 131
LDI r2, 42
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
