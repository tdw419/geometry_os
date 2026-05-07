; mixed program
; initialization
  LDI r14, 3627
  LDI r10, 666
  LDI r11, 3473
  LDI r7, 1970
  IKEY r10
  CMPI r10, 16
  JNZ r10, key_0
  SAR r2, r7, r3
  SHR r4, r7, r13
  IKEY r12
  CMPI r12, 0
  JNZ r12, key_1
  LDI r6, 64
  STORE r6, r0
  LOAD r10, r6
  LDI r2, 0x25C57C
  STORE r2, r8
  LOAD r15, r2
  SUB r10, r5, r15
  CALL func_2
func_2:
  OR r0, r2, r14
  MUL r4, r0, r1
  MUL r14, r10, r15
  RET
main_3:
  CMPI r6, 255
  OR r4, r3, r2
  OR r8, r7, r9
  ADDI r6, r7, 1
  FRAME
  JMP main_3
