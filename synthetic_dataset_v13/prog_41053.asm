; DESCRIPTION: Creates a white rectangular region at (284, 129) spanning 46 by 95 pixels.
; PLAN: r0=284(x), r1=129(y), r2=46(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 129
LDI r2, 46
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
