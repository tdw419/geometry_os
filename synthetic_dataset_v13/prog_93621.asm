; DESCRIPTION: Creates a red rectangular region at (202, 124) spanning 14 by 111 pixels.
; PLAN: r0=202(x), r1=124(y), r2=14(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 124
LDI r2, 14
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
