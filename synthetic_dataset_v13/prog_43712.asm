; DESCRIPTION: Creates a white rectangular region at (386, 50) spanning 56 by 111 pixels.
; PLAN: r0=386(x), r1=50(y), r2=56(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 50
LDI r2, 56
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
