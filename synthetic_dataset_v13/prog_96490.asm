; DESCRIPTION: Creates a black rectangular region at (401, 206) spanning 90 by 27 pixels.
; PLAN: r0=401(x), r1=206(y), r2=90(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 206
LDI r2, 90
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
