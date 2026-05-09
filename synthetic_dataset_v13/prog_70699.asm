; DESCRIPTION: Creates a white rectangular region at (284, 174) spanning 95 by 60 pixels.
; PLAN: r0=284(x), r1=174(y), r2=95(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 174
LDI r2, 95
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
