; DESCRIPTION: Creates a red rectangular region at (446, 176) spanning 32 by 46 pixels.
; PLAN: r0=446(x), r1=176(y), r2=32(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 176
LDI r2, 32
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
