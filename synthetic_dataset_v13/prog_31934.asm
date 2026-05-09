; DESCRIPTION: Creates a cyan rectangular region at (322, 93) spanning 29 by 109 pixels.
; PLAN: r0=322(x), r1=93(y), r2=29(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 93
LDI r2, 29
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
