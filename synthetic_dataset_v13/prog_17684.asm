; DESCRIPTION: Creates a cyan rectangular region at (403, 129) spanning 76 by 34 pixels.
; PLAN: r0=403(x), r1=129(y), r2=76(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 129
LDI r2, 76
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
