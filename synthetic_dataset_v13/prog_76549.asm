; DESCRIPTION: Creates a red rectangular region at (242, 50) spanning 24 by 80 pixels.
; PLAN: r0=242(x), r1=50(y), r2=24(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 50
LDI r2, 24
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
