; DESCRIPTION: Creates a red rectangular region at (377, 107) spanning 82 by 91 pixels.
; PLAN: r0=377(x), r1=107(y), r2=82(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 107
LDI r2, 82
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
