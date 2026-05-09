; DESCRIPTION: Creates a green rectangular region at (294, 46) spanning 77 by 61 pixels.
; PLAN: r0=294(x), r1=46(y), r2=77(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 46
LDI r2, 77
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
