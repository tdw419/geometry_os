; DESCRIPTION: Creates a cyan rectangular region at (272, 178) spanning 111 by 27 pixels.
; PLAN: r0=272(x), r1=178(y), r2=111(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 178
LDI r2, 111
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
