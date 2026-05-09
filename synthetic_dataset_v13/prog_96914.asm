; DESCRIPTION: Creates a cyan rectangular region at (269, 93) spanning 112 by 82 pixels.
; PLAN: r0=269(x), r1=93(y), r2=112(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 93
LDI r2, 112
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
