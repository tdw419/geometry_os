; DESCRIPTION: Creates a white rectangular region at (242, 177) spanning 21 by 45 pixels.
; PLAN: r0=242(x), r1=177(y), r2=21(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 177
LDI r2, 21
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
