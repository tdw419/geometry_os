; DESCRIPTION: Creates a cyan rectangular region at (317, 8) spanning 95 by 39 pixels.
; PLAN: r0=317(x), r1=8(y), r2=95(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 8
LDI r2, 95
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
